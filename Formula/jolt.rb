class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.13/joltc-v0.4.13-aarch64-macos.tar.gz"
      sha256 "aeb27cf5259a0c7cb38ca5c995cd589d92c25dce8b1bc9aeecd3c12426c472ee"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.13/joltc-v0.4.13-x86_64-linux.tar.gz"
      sha256 "0e19a0e55761deae3af5090f3869581a389ddc783637771e0e95e3c4999b3162"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
