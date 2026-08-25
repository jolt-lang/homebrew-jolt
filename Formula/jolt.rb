class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.27/jolt-v0.7.27-aarch64-macos.tar.gz"
      sha256 "bd6df38e1472e35326298ee6cdbe6ab078705040c4c1b29d797e4e7fef3fe836"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.27/jolt-v0.7.27-x86_64-linux.tar.gz"
      sha256 "e91ce480eac517f0fdc4d811ba4973f52fc96246b2639956d10b7ddd4b6b203d"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
