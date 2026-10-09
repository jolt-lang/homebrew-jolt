class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.20/jolt-v0.8.20-aarch64-macos.tar.gz"
      sha256 "bfb9c5dc039ec0bffd3673b611dff2d87c4653704c39e78938eb3f4135f8601f"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.20/jolt-v0.8.20-x86_64-linux.tar.gz"
      sha256 "5400ed3c46d704ce30693b68edaa7998c248023f07b9df727447883343fcd050"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
