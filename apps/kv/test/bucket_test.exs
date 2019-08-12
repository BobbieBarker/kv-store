defmodule KV.BucketTest do
  use ExUnit.Case, async: true
  setup do
    {:ok, bucket} = KV.Bucket.start_link([])
    %{bucket: bucket}
  end

  test "stores value by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil
    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  # test "deletes value by key", %{bucket: bucket} do
  #   // wip write test body
  # end

  test "are temporary workers"do
    assert Supervisor.child_spec(KV.Bucket, []).restart == :temporary
  end
end
