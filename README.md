# <a name="title"></a> Busser::RunnerPlugin::Shindo

[![Gem Version](https://badge.fury.io/rb/busser-shindo.png)](http://badge.fury.io/rb/busser-shindo)
[![Build Status](https://travis-ci.org/OpsRockin/busser-shindo.png?branch=master)](https://travis-ci.org/OpsRockin/busser-shindo)

A Busser runner plugin for the Shindo.

The Shindo is simple depth first ruby testing.

## <a name="installation"></a> Installation and Setup

Put test which written using the Shindo to `test/integration/${suite_name}`directory.

```
test
└── integration
    └── ${suite_name}
        └── shindo
            └── example_tests.rb
```

## <a name="usage"></a> Usage

run ` kitchen verify`

Your tests will run with `shindont` command automatically.

How to write test using the Shindo?
See here. [https://github.com/geemus/shindo](https://github.com/geemus/shindo).


## <a name="development"></a> Development

* Source hosted at [GitHub][repo]
* Report issues/questions/feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make. For
example:

1. Fork the repo
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## <a name="authors"></a> Authors


Created and maintained by [Yukihiko Sawanobori][author] (<sawanoboriyu@higanworks.com>)
(Original busser-serverspec) Created and maintained by [HIGUCHI Daisuke][author] (<d-higuchi@creationline.com>)

## <a name="license"></a> License

Apache 2.0 (see [LICENSE][license])


[author]:           https://github.com/sawanoboly
[issues]:           https://github.com/sawanoboly/busser-shindo/issues
[license]:          https://github.com/sawanoboly/busser-shindo/blob/master/LICENSE
[repo]:             https://github.com/sawanoboly/busser-shindo
[plugin_usage]:     http://docs.kitchen-ci.org/busser/plugin-usage
