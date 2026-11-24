class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.30/jolt-v0.8.30-aarch64-macos.tar.gz"
      sha256 "0736bb9a3764835bdc407db81b5a442b333899752b09f8700968fc9afda85536"
    end
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.30/jolt-v0.8.30-x86_64-macos.tar.gz"
      sha256 "5ab46b917fbfee0ebde75f2eb5b8785c6f408dcf2a2de03801f1a37f01269a77"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.30/jolt-v0.8.30-x86_64-linux.tar.gz"
      sha256 "c9eb00ce9b58e6ab19dcfc324edad2ad5127bab7339e8d018ce2c30876037bdd"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
