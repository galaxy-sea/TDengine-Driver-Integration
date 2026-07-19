/*
 * Copyright 2026-present The original author or authors.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

package plus.wcj.jetbrains.plugins.tdengine

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class TdengineMetadataQueriesTest {

    @Test
    fun `skips virtual tables before TDengine 3_3_6_0`() {
        listOf("3.3.3.0", "3.3.5.8").forEach { version ->
            val queries = TdengineMetadataQueries.build(version, "ams", null)

            assertEquals(
                listOf("SHOW NORMAL ams.TABLES", "SHOW ams.STABLES"),
                queries,
                "Unexpected queries for TDengine $version"
            )
        }
    }

    @Test
    fun `loads virtual tables starting with TDengine 3_3_6_0`() {
        listOf("3.3.6.0", "3.3.6.1", "3.4.0.0").forEach { version ->
            val queries = TdengineMetadataQueries.build(version, "ams", null)

            assertEquals(
                listOf(
                    "SHOW NORMAL ams.TABLES",
                    "SHOW NORMAL ams.VTABLES",
                    "SHOW ams.STABLES"
                ),
                queries,
                "Unexpected queries for TDengine $version"
            )
        }
    }

    @Test
    fun `extracts version from product version text`() {
        val queries = TdengineMetadataQueries.build("TDengine 3.3.6.0.community", "ams", "metric_%")

        assertTrue(queries.any { it == "SHOW NORMAL ams.VTABLES LIKE 'metric_%'" })
    }

    @Test
    fun `skips virtual tables when product version is unknown`() {
        val queries = TdengineMetadataQueries.build("unknown", "ams", null)

        assertFalse(queries.any { it.contains("VTABLES") })
    }
}
