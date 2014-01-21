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
  end

  def test
    run!("shindont #{suite_path('shindo')}")
  end
end
