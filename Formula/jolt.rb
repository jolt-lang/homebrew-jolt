class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.18/jolt-v0.8.18-aarch64-macos.tar.gz"
      sha256 "e5bd6e8c4c84d4086f83c1b5dc56b41de7a1cff85326ab849511bb0ccb808589"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.18/jolt-v0.8.18-x86_64-linux.tar.gz"
      sha256 "554f6100132bb75468df5f46a85d144248c5b681d091c489117daa34763072b0"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
