class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.13/jolt-v0.7.13-aarch64-macos.tar.gz"
      sha256 "7edc19e93468afe39080a078c2762c122f16a2e8b90aeb45fb71f281af05deee"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.13/jolt-v0.7.13-x86_64-linux.tar.gz"
      sha256 "0099ae878f18d574a796d0d9e5e88ea5c22ab238dc2f4df3573d24e72cc9ebeb"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
