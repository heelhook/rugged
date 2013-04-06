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

  def test_delta
    oid_1 = "36060c58702ed4c2a40832c51758d5344201d89a"
    commit = @repo.lookup(oid_1)
    commit_parent = commit.parents.first

    diff = commit.diff(commit_parent)

    count = 0
    diff.each_delta do |delta|
      puts "Delta: #{delta}"
      puts "Status: #{delta.status}"
      puts "Old file: #{delta.old_file}"
      puts "New file: #{delta.new_file}"
      puts "Similarity: #{delta.similarity}"
      puts "Status: #{delta.status}"
      #puts "Binary: #{delta.binary}"
      #puts "Hunk count: #{delta.hunk_count}\n"
      count += 1
    end

    assert_equal 4, count
  end
end
