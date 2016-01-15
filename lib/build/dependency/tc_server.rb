# Encoding: utf-8
# Copyright (c) 2013 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'build/dependency'
require 'build/dependency/base'
require 'build/mmmq_normalizer'

module Build
  module Dependency
    class TcServer < Base
      include Build::MMMQNormalizer

      def initialize(options)
        super 'tc-server', 'tar.gz', options
      end

      protected

      def version_specific(version)
        fail "Unable to process version '#{version}'" unless version =~ /[\d]+\.[\d]+\.[\d]+/
        prefix = version =~ /2\.[\d]+\.[\d]+/ ? 'vfabric' : 'pivotal'
        ->(v) { "http://repo.eng.pivotal.io/artifactory/simple/tcserver-releases/tcserver/standard/#{prefix}-tc-server-standard/#{v}/#{prefix}-tc-server-standard-#{v}.tar.gz" }
      end
    end
  end
end
