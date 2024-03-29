<?php
/**
 * JobRoller Actions
 * Hooks into various actions in the theme.
 *
 *
 * @version 1.0
 * @author AppThemes
 * @package JobRoller
 * @copyright 2011 all rights reserved
 *
 */

// add the post meta before the blog post content 
function jr_blog_post_meta() {
	if(is_page()) return; // don't do post-meta on pages
	global $post;

	?>
	<p class="meta"><em><?php _e('Posted by', 'appthemes'); ?></em> <?php the_author_posts_link(); ?> | <?php echo jr_ad_posted($post->post_date); ?> | <?php the_category(', '); ?></p>
	<?php
}
add_action('appthemes_after_blog_post_title', 'jr_blog_post_meta');

// add additional argument to url on blog posts to retrieve all the author posts instead of any of jobroller's custom post types
function jr_author_posts_link($link) {
	global $authordata, $post;

	$author_posts_url = get_author_posts_url( $authordata->ID, $authordata->user_nicename );
	$author_posts_url = ( 'post'==get_post_type($post) ? add_query_arg('blog_posts', '1', $author_posts_url) : '');

	$link = sprintf(
                '<a href="%1$s" title="%2$s" rel="author">%3$s</a>',
                $author_posts_url,
                esc_attr( sprintf( __( 'Posts by %s' ), get_the_author() ) ),
                get_the_author()
        );

	return $link;
}
add_action('the_author_posts_link','jr_author_posts_link');

// add the post tags and counter after the blog post content only on single blog page
function jr_blog_post_after() {
	if( !is_singular('post') ) return; // only show on blog post single page
	if(is_page()) return; // don't do post-meta on pages
	global $post;	
	
	if (get_option('jr_ad_stats_all') == 'yes') :
		?>
		<p class="stats"><?php appthemes_stats_counter($post->ID); ?></p>
		<?php
	endif;				
	
	the_tags('<p class="tags">' . __('Tags:', 'appthemes') . ' ', ', ', '</p>');
}
add_action('appthemes_after_blog_post_content', 'jr_blog_post_after');


// add the error message if no pages are found
function jr_page_loop_else() {
	?>	
	<p><?php _e('Sorry, no posts matched your criteria.', 'appthemes'); ?></p>
	<?php
}
add_action('appthemes_page_loop_else', 'jr_page_loop_else');


// add the error message if no blog posts are found
function jr_blog_loop_else() {
	?>	
	<p class="posts"><?php _e('No blog posts found.', 'appthemes'); ?></p>
	<?php
}
add_action('appthemes_blog_loop_else', 'jr_blog_loop_else');


// add the error message if no resume posts are found
function jr_resume_loop_else() {
	?>	
	<p class="resumes"><?php _e('No matching resumes found.', 'appthemes'); ?></p>
	<?php
}
add_action('appthemes_resume_loop_else', 'jr_resume_loop_else');

// add the error message if no pages are found
function jr_job_loop_else() {
	?>	
	<p class="jobs"><?php _e('No jobs found.', 'appthemes'); ?></p>
	<?php
}
add_action('appthemes_job_listing_loop_else', 'jr_job_loop_else');


/**
 * query jobs on homepage in main wp query, fixes pagination
 * @since 1.6.2
 */
function jr_query_jobs_on_homepage( $query ) {
	if( $query->is_main_query() && $query->is_home() )
		$query->set( 'post_type', APP_POST_TYPE );
}
if ( version_compare($wp_version, '3.4', '>=') )
	add_action( 'pre_get_posts', 'jr_query_jobs_on_homepage' );


/* Job Listing Pages */
function jr_expired_action() {
	$action = get_option('jr_expired_action');
	if ($action=='hide') :
		add_filter('posts_where', 'jr_job_not_expired');
	endif;
}
add_action('jobs_will_display', 'jr_expired_action');

/* Main Section */
add_action('job_main_section', 'jr_process_application_form', 1);
add_action('job_main_section', 'jr_expired_message', 1, 1);

/* Footer */
add_action('job_footer', 'jr_application_form', 1);
add_action('job_footer', 'jr_share_form', 2);
add_action('job_footer', 'jr_job_map', 3);

/* Others */

/**
 * controls password fields visibility
 * @since 1.6.4
 */
function jr_password_fields_support( $bool ) {
	global $app_abbr;
	return (bool) ( 'yes' == get_option($app_abbr.'_allow_registration_password') );
}
add_filter( 'show_password_fields', 'jr_password_fields_support' );
