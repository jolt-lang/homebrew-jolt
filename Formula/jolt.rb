class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.5/jolt-v0.8.5-aarch64-macos.tar.gz"
      sha256 "42dcc820f21319e9894498d3cdb9440a1732d1ad6db4dd472e9202649d66d50c"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.5/jolt-v0.8.5-x86_64-linux.tar.gz"
      sha256 "e725417ddf3c198f354d7aeccd81bd9de99f3adbdc2d0b02c955edeb117b8ad8"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
