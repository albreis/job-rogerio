<?php

// autoload_real.php @generated by Composer

class ComposerAutoloaderInitbe8b85544c8253e2f2faafc349c36956
{
    private static $loader;

    public static function loadClassLoader($class)
    {
        if ('Composer\Autoload\ClassLoader' === $class) {
            require __DIR__ . '/ClassLoader.php';
        }
    }

    /**
     * @return \Composer\Autoload\ClassLoader
     */
    public static function getLoader()
    {
        if (null !== self::$loader) {
            return self::$loader;
        }

        require __DIR__ . '/platform_check.php';

        spl_autoload_register(array('ComposerAutoloaderInitbe8b85544c8253e2f2faafc349c36956', 'loadClassLoader'), true, true);
        self::$loader = $loader = new \Composer\Autoload\ClassLoader(\dirname(__DIR__));
        spl_autoload_unregister(array('ComposerAutoloaderInitbe8b85544c8253e2f2faafc349c36956', 'loadClassLoader'));

        require __DIR__ . '/autoload_static.php';
        call_user_func(\Composer\Autoload\ComposerStaticInitbe8b85544c8253e2f2faafc349c36956::getInitializer($loader));

        $loader->register(true);

        return $loader;
    }
}
