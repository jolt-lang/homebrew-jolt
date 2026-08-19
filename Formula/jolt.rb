class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.16/jolt-v0.7.16-aarch64-macos.tar.gz"
      sha256 "acb02470125c31fabf77324246e1cf4c3389b300f0e65da1678151e8fa7d0bf7"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.16/jolt-v0.7.16-x86_64-linux.tar.gz"
      sha256 "2e2a745b16aad7cfa0389b2504d4d78df2cf90907186aacfb115f36394363e7a"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
