<?php
/**
 * The base configuration for WordPress
 *
 * @package WordPress
 */

// ** MySQL settings ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'mydb');

/** MySQL database username */
define( 'DB_USER', 'gifulvi');

/** MySQL database password */
define( 'DB_PASSWORD', 30101998);

/** MySQL hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. */
define( 'DB_COLLATE', '' );

define( 'WP_ALLOW_REPAIR', true );

/**#@+
 * Authentication Unique Keys and Salts.
 * Change these to different unique phrases!
 */
define('AUTH_KEY',         ']<h)&v{Tbx.@:3K<xB}L7/wd|wgZz2D+,;c;.Z:b7UrVN[j|Lp)jT9V+HB#C @E8');
define('SECURE_AUTH_KEY',  '~(zBIK+VcLnq%]5BR5eLgz^Lx-XLr+b|ryx(HS*J!oV=k%dbkCw/^nU5$zhw0x|n');
define('LOGGED_IN_KEY',    'V8~;&;lexX]Y3@Q- x(ilfg <KM&{Tg[oF`Ox@QaehWFX;+EN1JF&bB)U<s<=-L8');
define('NONCE_KEY',        ':*.elz7#;K0s+4)XKH{).dg!aqP@o=q=1)N9LDzi-AqILG vL<cmtEft4q9#DO6F');
define('AUTH_SALT',        '$&?J7U0;0;NVf$Ci5?.lO6e2htg1neDwn}]D.a-v} 8n}|#v+YjCd44j>?+O.wjn');
define('SECURE_AUTH_SALT', 'DM$u5+2*8IuBum8Hv}*khD_@L_L;PkvXUu+l@h)/ek^=s^tp3sG9)Q?u&s.WQR:x');
define('LOGGED_IN_SALT',   'C<XSxg-!9Ml<T<*tfB:.9,w@k;aF.C)<CwfM.l W6GXG.55^LEj,])ncvu,psOwu');
define('NONCE_SALT',       'jog.i fz2LKX$F0rO7zW*069chC3Y,#w,|8=C?sS5(r-w_2GL{ZB~gdU!BQ>Bjdk');

/**#@-*/

/** WordPress Database Table prefix. */
$table_prefix = 'wp_';

/** For developers: WordPress debugging mode. */
define( 'WP_DEBUG', true );

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>
