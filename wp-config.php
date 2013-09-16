<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'lokertki');

/** MySQL database username */
define('DB_USER', 'admin');

/** MySQL database password */
define('DB_PASSWORD', 'tubagus88');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'B~PU)@b)+c^z.%AyeAt[+#]i7w#[nCJ{$4JLi@o(Nwe_d.POBIR:OT1<L$_%7368');
define('SECURE_AUTH_KEY',  '1?ejI=r*L#eS(;]VWv`0nc;h;B1q;@,$^G+x>ZE0dz9m0nQf@L.:hh|{.+Bd*PK-');
define('LOGGED_IN_KEY',    'Uzc$KU3Bt_K.wc?u(CWMc0[=gmTxSv&XkHOZ%D>yePC=PAh}MIxRtX,8TA_x,)c.');
define('NONCE_KEY',        'Xxw+A TdhW^_n}LX:v3AEq+;X4XA=nVC!g4zIZ~ut-dns,%b/v){,%7,H$[yzIV{');
define('AUTH_SALT',        'a<Rm;u1W/M<0cLSq4@C}+k:yQ^XAO3tN$ t+5U}feo~Ow!E1I +af0Hd?bE4Zm5(');
define('SECURE_AUTH_SALT', '5^`OrG)s_s.rV})W)FYa ^g%bEIO=03Q=-xdyp3@,mZc-jk9?I95f@p}ywhz(0@L');
define('LOGGED_IN_SALT',   'zv,cPAnhM-&ZjKDS}4of9d5=JRF vyLfAP^]Of@ySN).G3qZR;_35j;C.k0LgG0m');
define('NONCE_SALT',       'kEn!-3, 5`m;F;SAg/X=i30A>uH=Uy%nRHIY${Bi=s|~LyTe-eaY/WV/|r`SQW7D');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
