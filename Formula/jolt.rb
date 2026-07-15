class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.3.1/joltc-v0.3.1-aarch64-macos.tar.gz"
      sha256 "7492a9ef1577c7a689be6a4993c893568d7edddb3ce437a648b6fec9f9a01396"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.3.1/joltc-v0.3.1-x86_64-linux.tar.gz"
      sha256 "c28bcb17b4c794437559d00672fd8943d8839a658d778cb5b1678b7f0d4a53b7"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
