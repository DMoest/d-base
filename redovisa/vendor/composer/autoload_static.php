<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitc47b5cd0dd101b02da8f9c6f54e2725e
{
    public static $files = array (
        '2cffec82183ee1cea088009cef9a6fc3' => __DIR__ . '/..' . '/ezyang/htmlpurifier/library/HTMLPurifier.composer.php',
        'b6ec61354e97f32c0ae683041c78392a' => __DIR__ . '/..' . '/scrivo/highlight.php/HighlightUtilities/functions.php',
    );

    public static $prefixLengthsPsr4 = array (
        'M' => 
        array (
            'Michelf\\' => 8,
        ),
        'A' => 
        array (
            'Anax\\' => 5,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Michelf\\' => 
        array (
            0 => __DIR__ . '/..' . '/michelf/php-markdown/Michelf',
        ),
        'Anax\\' => 
        array (
            0 => __DIR__ . '/..' . '/anax/textfilter/src',
        ),
    );

    public static $prefixesPsr0 = array (
        'M' => 
        array (
            'Michelf' => 
            array (
                0 => __DIR__ . '/..' . '/michelf/php-smartypants',
            ),
        ),
        'H' => 
        array (
            'Highlight\\' => 
            array (
                0 => __DIR__ . '/..' . '/scrivo/highlight.php',
            ),
            'HighlightUtilities\\' => 
            array (
                0 => __DIR__ . '/..' . '/scrivo/highlight.php',
            ),
            'HTMLPurifier' => 
            array (
                0 => __DIR__ . '/..' . '/ezyang/htmlpurifier/library',
            ),
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitc47b5cd0dd101b02da8f9c6f54e2725e::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitc47b5cd0dd101b02da8f9c6f54e2725e::$prefixDirsPsr4;
            $loader->prefixesPsr0 = ComposerStaticInitc47b5cd0dd101b02da8f9c6f54e2725e::$prefixesPsr0;

        }, null, ClassLoader::class);
    }
}
