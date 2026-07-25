class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.0/jolt-v0.5.0-aarch64-macos.tar.gz"
      sha256 "37f066038ea018fc54f8f8e54b1120a550195014a04ff4c86098d2c5273f6aad"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.0/jolt-v0.5.0-x86_64-linux.tar.gz"
      sha256 "8685cd2a437808cb4b3d8f1ad4cb864d292507e41c04b018d11db5393d2f1694"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
