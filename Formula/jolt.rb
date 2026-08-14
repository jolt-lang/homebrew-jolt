class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.10/jolt-v0.7.10-aarch64-macos.tar.gz"
      sha256 "18beaabe007fee0b626d06e23c537f802a6c1baf0e7542b90360999756cbc3df"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.10/jolt-v0.7.10-x86_64-linux.tar.gz"
      sha256 "b57ef81371b1c85f16c9b5f0cc52a17bc112023e2b2a2db2b10612c2bed840c3"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
