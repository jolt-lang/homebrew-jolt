class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.25/jolt-v0.7.25-aarch64-macos.tar.gz"
      sha256 "10be9327f260ad20d4f2797d7774a34c2ee098f28a0a2c2feac6d51de41d736a"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.25/jolt-v0.7.25-x86_64-linux.tar.gz"
      sha256 "0d6f95a80923dd9ed68415203ad07efb5d7ec4ad98eff78e85597040eab7a417"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
