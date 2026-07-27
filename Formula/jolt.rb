class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.7/jolt-v0.5.7-aarch64-macos.tar.gz"
      sha256 "c2cb23fe853b09e8098edad9361566ed841f5f31ba04bea3fd1d2cb11d5dbbe3"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.7/jolt-v0.5.7-x86_64-linux.tar.gz"
      sha256 "35b8eaa3d53af4ad80ce8c7bcc937fb67400d6cf25260b91e7e42a01cca2dea5"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
