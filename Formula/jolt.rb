class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.2/jolt-v0.8.2-aarch64-macos.tar.gz"
      sha256 "6d310d7bf6f534fa730c9676ab16a700723e8c48782334156bc05025b6dc6825"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.2/jolt-v0.8.2-x86_64-linux.tar.gz"
      sha256 "0f4ba602b65206334700e90eb8c299d54f34889c9148c61246fd848235cf1bcb"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
