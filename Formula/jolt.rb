class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.1.5/joltc-v0.1.5-aarch64-macos.tar.gz"
      sha256 "4cebdbcd6df2cf72478859cbed9afc70c3c69e98ad0ceb30e7115ab28b948e66"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.1.5/joltc-v0.1.5-x86_64-linux.tar.gz"
      sha256 "a5a253b07989926c35465829144ac640b4a5baa926616f12ad7fc54a2381c26b"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
