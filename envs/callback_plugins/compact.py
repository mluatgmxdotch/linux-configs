from ansible.plugins.callback import CallbackBase

DOCUMENTATION = '''
    callback: compact
    type: stdout
    short_description: One line per task and host, prefixed with the role name
'''


class CallbackModule(CallbackBase):
    CALLBACK_VERSION = 2.0
    CALLBACK_TYPE = 'stdout'
    CALLBACK_NAME = 'compact'

    def __init__(self):
        super(CallbackModule, self).__init__()
        self.task_prefix = ''
        self.task_name = ''

    def v2_playbook_on_task_start(self, task, is_conditional):
        role = task._role
        self.task_prefix = '[{0}] '.format(role.get_name()) if role else ''
        self.task_name = task.get_name()

    def _line(self, result, status):
        self._display.display('{0}{1}: {2} {3}'.format(
            self.task_prefix, self.task_name, result._host.get_name(), status))

    def v2_runner_on_ok(self, result):
        self._line(result, 'changed' if result._result.get('changed') else 'ok')

    def v2_runner_on_failed(self, result, ignore_errors=False):
        self._line(result, 'FAILED')

    def v2_runner_on_unreachable(self, result):
        self._line(result, 'UNREACHABLE')

    def v2_runner_on_skipped(self, result):
        self._line(result, 'skipped')
