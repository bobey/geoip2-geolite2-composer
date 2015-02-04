# GeoIP2 / GeoLite2 for Composer

## Description

This tiny repository aims to provide an easy solution to require GeoIP2 / GeoLite2 databases inside your project using composer.
This is particularly usefull if you use it in conjunction with the [GeoIP2 PHP API](https://github.com/maxmind/GeoIP2-php).

## Install via composer

Just run the following command in your project root:

```
composer require bobey/geoip2-geolite2-composer:~1.0
```

## Use it with the GeoIP2 PHP API

```
composer require geoip2/geoip2:~2.0
```

### City Example rewritten

The following example is the one provided in the [GeoIP2 PHP API](https://github.com/maxmind/GeoIP2-php) README rewritten to lookup the GeoLite2 database inside your vendors directory.

```php
<?php
require_once 'vendor/autoload.php';
use GeoIp2\Database\Reader;

// This creates the Reader object, which should be reused across
// lookups.
$reader = new Reader('vendor/bobey/geoip2-geolite2-composer/GeoIP2/GeoIP2-City.mmdb');

// Replace "city" with the appropriate method for your database, e.g.,
// "country".
$record = $reader->city('128.101.101.101');

print($record->country->isoCode . "\n"); // 'US'
print($record->country->name . "\n"); // 'United States'
print($record->country->names['zh-CN'] . "\n"); // '美国'

print($record->mostSpecificSubdivision->name . "\n"); // 'Minnesota'
print($record->mostSpecificSubdivision->isoCode . "\n"); // 'MN'

print($record->city->name . "\n"); // 'Minneapolis'

print($record->postal->code . "\n"); // '55455'

print($record->location->latitude . "\n"); // 44.9733
print($record->location->longitude . "\n"); // -93.2323
```

## Update

GeoLite2 databases are updated on the first Tuesday of each month.
I will try to update and tag a new version of this repository as often as possible.
In the meantime, if you want to update the databases yourself, just fork the repository, execute the update script by running the following command:

```
./scripts/update.sh
```

Then, just make a pull request!

## License

The GeoLite2 databases are distributed under the [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/).
The attribution requirement may be met by including the following in all advertising and documentation mentioning features of or use of this database:

> This product includes GeoLite2 data created by MaxMind, available from
> <a href="http://www.maxmind.com">http://www.maxmind.com</a>.
