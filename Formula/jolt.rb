class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.15/jolt-v0.8.15-aarch64-macos.tar.gz"
      sha256 "b14633802b224b8b90264c4e8101eba8501b59642b283f365d39ef611e2250b2"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.15/jolt-v0.8.15-x86_64-linux.tar.gz"
      sha256 "1f244c96f71f0480d062edbbf4e180c87dd1ef99bc082ae93f84b8bca9bac288"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
