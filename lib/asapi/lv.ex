#   asapi/lv
#   Copyright (C) 2017  tynn
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU Affero General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU Affero General Public License for more details.
#
#   You should have received a copy of the GNU Affero General Public License
#   along with this program. If not, see <http://www.gnu.org/licenses/>.

defmodule Asapi.Lv do
  def of?(artifact) do
    version versions manifest artifact
  end

  defp manifest(artifact) do
    args = ["-Partifact=" <> artifact, "-bbin/manifest.gradle"]
    {manifest, 0} = System.cmd "gradle", args, stderr_to_stdout: true
    manifest
  end

  defp versions(manifest) do
    min_sdk = version Regex.run ~R/android:minSdkVersion="([0-9]+)"/, manifest
    max_sdk = version Regex.run ~R/android:maxSdkVersion="([0-9]+)"/, manifest
    {min_sdk, max_sdk}
  end

  defp version(nil) do
    nil
  end

  defp version([_, version]) do
    elem Integer.parse(version), 0
  end

  defp version(versions) do
    case versions do
      {nil, nil} -> "1+"
      {min_sdk, nil} -> to_string(min_sdk) <> "+"
      {nil, max_sdk} -> "1-" <> to_string(max_sdk)
      {min_sdk, max_sdk} -> to_string(min_sdk) <> "-" <> to_string(max_sdk)
    end
  end
end
