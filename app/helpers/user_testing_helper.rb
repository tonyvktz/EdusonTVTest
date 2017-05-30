module UserTestingHelper
  def success_link(assignable)
    pass_link(assignable, true)
  end

  def fail_link(assignable)
    pass_link(assignable, false)
  end

  def pass_link(assignable, is_success)
    link_to((is_success ? 'Success' : 'Fail'),
            pass_user_testing_path(@user,
                                   assignable_id: assignable.id,
                                   assignable_type: assignable.class,
                                   success: is_success),
            method: :post)
  end
end
