class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.7/jolt-v0.6.7-aarch64-macos.tar.gz"
      sha256 "8367d70d8d3371b5d28b838f621fd75874707562439bb827d1f762128a08c35f"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.7/jolt-v0.6.7-x86_64-linux.tar.gz"
      sha256 "82c1b1c5477a027cbd189f1c4bac777bff7de1d888c9cf65e06bf233056821fe"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
