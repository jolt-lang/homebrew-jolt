class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.6/jolt-v0.5.6-aarch64-macos.tar.gz"
      sha256 "0639ccc602492dde41f66f9cac3718699ee53ac11c29f9feeef39419fa911aae"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.6/jolt-v0.5.6-x86_64-linux.tar.gz"
      sha256 "8743e89fb9a3d5bd237ecd2211f5e652b18b71f796ab977f55d7f76cd66b0be8"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
