class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.26/jolt-v0.8.26-aarch64-macos.tar.gz"
      sha256 "c0a4ad68f6ebae71088993d47c8926c50fe2e24c7178db75c44b5bcc55c527c9"
    end
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.26/jolt-v0.8.26-x86_64-macos.tar.gz"
      sha256 "453ec069cd2e63f6c142c12f837251ae44ef30df8ba988c258222c4fc777d57c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.26/jolt-v0.8.26-x86_64-linux.tar.gz"
      sha256 "af728d0e53d2265d49fa438a917afb49b8a28ea63016ac1d3e0e515d88d5dcad"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
