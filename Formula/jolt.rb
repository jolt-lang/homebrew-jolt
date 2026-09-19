class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.9/jolt-v0.8.9-aarch64-macos.tar.gz"
      sha256 "bb941dae85314f3cd21c00668c9ad6d3686cb5a583ddbf2130c58f3de45dde80"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.9/jolt-v0.8.9-x86_64-linux.tar.gz"
      sha256 "0984f7f954589d7aa40feab4748ad7c521a9de94d32afe30fd1be8d1ee92442b"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
