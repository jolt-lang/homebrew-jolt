class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.28/jolt-v0.8.28-aarch64-macos.tar.gz"
      sha256 "73727d6e7fe6e13126fb04fff91958016e537aef16be87e51b8680f652001e73"
    end
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.28/jolt-v0.8.28-x86_64-macos.tar.gz"
      sha256 "db6f82ffb2119c92e6887f7afb5c861550c3512d883e336492bc1ad4e4945af4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.28/jolt-v0.8.28-x86_64-linux.tar.gz"
      sha256 "6bd302f1ea5ab37bf2705898327cf1e1ad3fe27201978b240d3deaafcfe1925d"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
