class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.27/jolt-v0.8.27-aarch64-macos.tar.gz"
      sha256 "c85fb07350811d9b0762423b100796703d18a2bd6c7c4462a69b04a6f770177a"
    end
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.27/jolt-v0.8.27-x86_64-macos.tar.gz"
      sha256 "1cd4acbdd6f8a5fbec4fc2cdafd6cebe32e105d88f6021d46fb8dcb6075e85c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.27/jolt-v0.8.27-x86_64-linux.tar.gz"
      sha256 "7aedce645a5840772a74e0341da73e6e072f41107ee2b304fc7a4947021a64b4"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
