class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.24/jolt-v0.8.24-aarch64-macos.tar.gz"
      sha256 "912fa04146494e101a1aba2bf8e3848a5ed82eaecb8e20a795ceed84b3893497"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.24/jolt-v0.8.24-x86_64-linux.tar.gz"
      sha256 "8f5dc27988830c7cf1780fd877e2b35ae6a5aa2acce79760194ff007ed3447d7"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
