class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.14/jolt-v0.8.14-aarch64-macos.tar.gz"
      sha256 "9f9baf7fae07c33086f2cdc706464d3bc0aaa73c43aa1a73f81910fb6999ba60"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.14/jolt-v0.8.14-x86_64-linux.tar.gz"
      sha256 "6226ac4cca00db689861aa4bdd7975b11856d3d709b056c17fe186476a73f3d3"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
