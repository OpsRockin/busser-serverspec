# -*- encoding: utf-8 -*-
#
# Author:: Yukihiko Sawanobori (<sawanoboriyu@higanworks.com>)
# Author:: HIGUCHI Daisuke (<d-higuchi@creationline.com>)
#
# Copyright (C) 2014, Yukihiko Sawanobori
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'busser/runner_plugin'

# A Busser runner plugin for Shindo.
#
# @author Yukihiko Sawanobori (<sawanoboriyu@higanworks.com>)
#
class Busser::RunnerPlugin::Shindo < Busser::RunnerPlugin::Base
  postinstall do
    install_gem("shindo")
    install_gem("bundler")
  end

  def test
    ## Refered from busser-rspec
    gemfile_path = File.join(suite_path, 'shindo', 'Gemfile')
    if File.exists?(gemfile_path)
    # Bundle install local completes quickly if the gems are already found locally
    # it fails if it needs to talk to the internet. The || below is the fallback
    # to the internet-enabled version. It's a speed optimization.
      banner('Bundle Installing..')
      ENV['PATH'] = [ENV['PATH'], Gem.bindir].join(':')
      bundle_option = "--gemfile #{gemfile_path}"
      run("bundle install --local #{bundle_option} || bundle install #{bundle_option}")
    end

    banner('run shindont')
    run!("env PATH=#{ENV['PATH']}:#{Gem.bindir} shindont #{suite_path('shindo')}")
  end
end
