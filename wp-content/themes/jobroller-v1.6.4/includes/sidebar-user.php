<?php global $userdata; ?>

<?php if ( is_user_logged_in() ): ?>

<li class="widget widget_user_options">

	<h2 class="widget_title"><?php _e('Account Options','appthemes'); ?></h2>

	<div class="widget_content">
		<ul>
			<?php if (is_user_logged_in()) : ?><li><a href="<?php echo get_permalink(get_option('jr_dashboard_page_id')) ?>"><?php _e('My Dashboard','appthemes')?></a></li><?php endif; ?>
			<li><a href="<?php
				$author = get_user_by('id', get_current_user_id());
				if ($author && $link = get_author_posts_url( $author->ID, $author->user_nicename )) echo $link;
			?>"><?php _e('View Profile','appthemes')?></a></li>
			<li><a href="<?php echo get_permalink(get_option('jr_user_profile_page_id')) ?>"><?php _e('Edit Profile','appthemes')?></a></li>
			<?php if (current_user_can('edit_others_posts')) { ?><li><a href="<?php echo get_option('siteurl'); ?>/wp-admin/"><?php _e('WordPress Admin','appthemes')?></a></li><?php } ?>
			<li><a href="<?php echo wp_logout_url(); ?>"><?php _e('Log Out','appthemes')?></a></li>
		</ul>
	</div>

</li>


<li class="widget widget_user_info">

	<h2 class="widget_title"><?php _e('Account Info','appthemes'); ?></h2>

	<div class="widget_content">
		<ul>
			<li><strong><?php _e('Username:','appthemes')?></strong> <?php echo $userdata->user_login; ?></li>
			<li><strong><?php _e('Account type:','appthemes')?></strong> <?php
				$user = new WP_User( $userdata->ID );

				if ( !empty( $user->roles ) && is_array( $user->roles ) ) {
					foreach ( $user->roles as $role )
						echo jr_translate_role($role) . '<br/>' ;					
				}
			?></li>
			<li><strong><?php _e('Member Since:','appthemes')?></strong> <?php appthemes_get_reg_date($userdata->user_registered); ?></li>
			<li><strong><?php _e('Last Login:','appthemes'); ?></strong> <?php appthemes_get_last_login($userdata->ID); ?></li>
		</ul>
	</div>

</li>

<?php endif; ?>