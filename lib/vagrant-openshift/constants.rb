#--
# Copyright 2013 Red Hat, Inc.
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
#++
require 'pathname'

module Vagrant
  module Openshift
    class Constants

      def self.repos(env)
        openshift3_repos
      end

      def self.openshift3_repos
        {
          'origin' => 'https://github.com/openshift/origin.git',
          'source-to-image' => 'https://github.com/openshift/source-to-image.git'
        }.merge(openshift3_images)
      end

      def self.openshift3_images
        {
          'wildfly-8-centos' => 'https://github.com/openshift/wildfly-8-centos.git',
          'ruby-20-centos' => 'https://github.com/openshift/ruby-20-centos.git'
        }
      end

      def self.images
        [
          'centos'
        ] + openshift3_images.map { |c, _| "openshift/#{c}" }
      end

      def self.git_branch_current
        "$(git rev-parse --abbrev-ref HEAD)"
      end

      def self.plugins_conf_dir
        Pathname.new "/plugins"
      end

      def self.sync_dir
        Pathname.new "~/sync"
      end

      def self.build_dir
        Pathname.new "/data/src/github.com/openshift/"
      end

      def self.git_ssh
        ""
      end

    end
  end
end
