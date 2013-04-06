require "test_helper"

class DiffTest < Rugged::TestCase
  include Rugged::RepositoryAccess

  def test_diff_patch_not_nil
    oid_1 = "36060c58702ed4c2a40832c51758d5344201d89a"
    commit = @repo.lookup(oid_1)
    commit_parent = commit.parents.first

    diff = commit.diff(commit_parent)

    assert !diff.patch.nil?
  end
end
