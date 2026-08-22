class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.22/jolt-v0.7.22-aarch64-macos.tar.gz"
      sha256 "b4f78f7408f719d88ff80ff9eb08966e602f5f48517581e8e5d165ffdf50a49e"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.22/jolt-v0.7.22-x86_64-linux.tar.gz"
      sha256 "a3f265074d2f556ac1f28917522e52f77b462d73ad8f640d80f3ddec59b2ba34"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
