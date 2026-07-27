class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.5/jolt-v0.5.5-aarch64-macos.tar.gz"
      sha256 "481117ebe22a1e3742b2c4fd7dcb50d5ee820f02a36373941b0f974b6dc3135f"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.5/jolt-v0.5.5-x86_64-linux.tar.gz"
      sha256 "5a1f68c3f07ed9d5007bc890d39ee0e9db78c36fec3bbb85751d2ba99188a748"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
