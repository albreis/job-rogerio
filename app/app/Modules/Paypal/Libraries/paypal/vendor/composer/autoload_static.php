<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitbe8b85544c8253e2f2faafc349c36956
{
    public static $prefixLengthsPsr4 = array (
        'P' => 
        array (
            'Psr\\Log\\' => 8,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Psr\\Log\\' => 
        array (
            0 => __DIR__ . '/..' . '/psr/log/Psr/Log',
        ),
    );

    public static $prefixesPsr0 = array (
        'P' => 
        array (
            'PayPal' => 
            array (
                0 => __DIR__ . '/..' . '/paypal/rest-api-sdk-php/lib',
            ),
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitbe8b85544c8253e2f2faafc349c36956::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitbe8b85544c8253e2f2faafc349c36956::$prefixDirsPsr4;
            $loader->prefixesPsr0 = ComposerStaticInitbe8b85544c8253e2f2faafc349c36956::$prefixesPsr0;
            $loader->classMap = ComposerStaticInitbe8b85544c8253e2f2faafc349c36956::$classMap;

        }, null, ClassLoader::class);
    }
}
