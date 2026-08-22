class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.21/jolt-v0.7.21-aarch64-macos.tar.gz"
      sha256 "0d81d3ffb4cbe69f27ef4b7103ea73fddb8e4578fba1f0a3099e359683b8f97e"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.21/jolt-v0.7.21-x86_64-linux.tar.gz"
      sha256 "162b0e8fc41f98c91cbc78bb3476884d1b05e96ca93cbc7855b319415515f51e"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
