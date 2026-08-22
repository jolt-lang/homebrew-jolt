class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.23/jolt-v0.7.23-aarch64-macos.tar.gz"
      sha256 "2e4b9804382548b58b10079aa73688afe587d7b6d0986ee52c61f843ae912bb9"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.23/jolt-v0.7.23-x86_64-linux.tar.gz"
      sha256 "feda9a68792b454fa540677069edc6b6d9b82aa8ab77ae8a322934f0b8cd32e7"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
