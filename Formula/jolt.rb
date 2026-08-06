class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.6/jolt-v0.6.6-aarch64-macos.tar.gz"
      sha256 "f7ccb154db71fb8b350d3258cfe89fbb7a98a628a3f5dcc3d283781c54f8427e"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.6/jolt-v0.6.6-x86_64-linux.tar.gz"
      sha256 "17c74573508f73faa08b36bb8f87d5e03a3369fd78f297ba2523ae2c735bf073"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
