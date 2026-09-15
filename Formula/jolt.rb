class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.8/jolt-v0.8.8-aarch64-macos.tar.gz"
      sha256 "96e8d0cdcfc83e313a156786c20eeefe72a451025d0fd0715fe9e72c5dc84fd2"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.8/jolt-v0.8.8-x86_64-linux.tar.gz"
      sha256 "bd7bc48591dcb5a7963e69d4a184343fa071cdd742e8e99d1189e262090b97e1"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
