class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.8/jolt-v0.5.8-aarch64-macos.tar.gz"
      sha256 "d2b9e7381b71631f6c2219ceb77de2b5e3e8320552da5d6e0a224ca4c4f98849"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.8/jolt-v0.5.8-x86_64-linux.tar.gz"
      sha256 "1728decede4e7c616b06196b356ad31f3a34f6eafc7f31426e2b2a994112009f"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
