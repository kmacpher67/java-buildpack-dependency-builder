/*
 * Copyright 2017 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.cloudfoundry.dependency.in;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.cloudfoundry.dependency.Source;
import org.cloudfoundry.dependency.VersionReference;

import java.util.Map;

final class InRequest {

    private final Map<String, Object> params;

    private final Source source;

    private final VersionReference version;

    InRequest(@JsonProperty("params") Map<String, Object> params, @JsonProperty("source") Source source, @JsonProperty("version") VersionReference version) {
        this.params = params;
        this.source = source;
        this.version = version;
    }

    Map<String, Object> getParams() {
        return this.params;
    }

    Source getSource() {
        return this.source;
    }

    VersionReference getVersion() {
        return this.version;
    }

}
