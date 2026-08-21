class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.20/jolt-v0.7.20-aarch64-macos.tar.gz"
      sha256 "dc25a7b8d6486160ddc1f9caea4bbc830906719766fdd361b1ad010bef67b400"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.20/jolt-v0.7.20-x86_64-linux.tar.gz"
      sha256 "cba286ac278885e172f8e9ba4cc48be8a25ad2abb4b2ec1c8048d189fedea61d"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
