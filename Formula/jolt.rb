class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.25/jolt-v0.8.25-aarch64-macos.tar.gz"
      sha256 "7b07ae2db68df0f47abe928f02301f8e7915bc75a40d5ec3c8e6628de416b231"
    end
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.25/jolt-v0.8.25-x86_64-macos.tar.gz"
      sha256 "ba46906ee4a3b621bc01db46d7335f47adbfd929af3fe153334777e03934f4d2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.25/jolt-v0.8.25-x86_64-linux.tar.gz"
      sha256 "07d5d8903295fdbf1caf310bedb11952880d863b31302b9c3f7e90ac4f3dfc71"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
