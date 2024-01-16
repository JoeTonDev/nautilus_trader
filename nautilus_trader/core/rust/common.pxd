# Warning, this file is autogenerated by cbindgen. Don't modify this manually. */

from cpython.object cimport PyObject
from libc.stdint cimport uint8_t, uint64_t, uintptr_t
from nautilus_trader.core.rust.core cimport CVec, UUID4_t
from nautilus_trader.core.rust.model cimport TraderId_t

cdef extern from "../includes/common.h":

    # The state of a component within the system.
    cpdef enum ComponentState:
        # When a component is instantiated, but not yet ready to fulfill its specification.
        PRE_INITIALIZED # = 0,
        # When a component is able to be started.
        READY # = 1,
        # When a component is executing its actions on `start`.
        STARTING # = 2,
        # When a component is operating normally and can fulfill its specification.
        RUNNING # = 3,
        # When a component is executing its actions on `stop`.
        STOPPING # = 4,
        # When a component has successfully stopped.
        STOPPED # = 5,
        # When a component is started again after its initial start.
        RESUMING # = 6,
        # When a component is executing its actions on `reset`.
        RESETTING # = 7,
        # When a component is executing its actions on `dispose`.
        DISPOSING # = 8,
        # When a component has successfully shut down and released all of its resources.
        DISPOSED # = 9,
        # When a component is executing its actions on `degrade`.
        DEGRADING # = 10,
        # When a component has successfully degraded and may not meet its full specification.
        DEGRADED # = 11,
        # When a component is executing its actions on `fault`.
        FAULTING # = 12,
        # When a component has successfully shut down due to a detected fault.
        FAULTED # = 13,

    # A trigger condition for a component within the system.
    cpdef enum ComponentTrigger:
        # A trigger for the component to initialize.
        INITIALIZE # = 1,
        # A trigger for the component to start.
        START # = 2,
        # A trigger when the component has successfully started.
        START_COMPLETED # = 3,
        # A trigger for the component to stop.
        STOP # = 4,
        # A trigger when the component has successfully stopped.
        STOP_COMPLETED # = 5,
        # A trigger for the component to resume (after being stopped).
        RESUME # = 6,
        # A trigger when the component has successfully resumed.
        RESUME_COMPLETED # = 7,
        # A trigger for the component to reset.
        RESET # = 8,
        # A trigger when the component has successfully reset.
        RESET_COMPLETED # = 9,
        # A trigger for the component to dispose and release resources.
        DISPOSE # = 10,
        # A trigger when the component has successfully disposed.
        DISPOSE_COMPLETED # = 11,
        # A trigger for the component to degrade.
        DEGRADE # = 12,
        # A trigger when the component has successfully degraded.
        DEGRADE_COMPLETED # = 13,
        # A trigger for the component to fault.
        FAULT # = 14,
        # A trigger when the component has successfully faulted.
        FAULT_COMPLETED # = 15,

    # The log color for log messages.
    cpdef enum LogColor:
        # The default/normal log color.
        NORMAL # = 0,
        # The green log color, typically used with [`LogLevel::Info`] log levels and associated with success events.
        GREEN # = 1,
        # The blue log color, typically used with [`LogLevel::Info`] log levels and associated with user actions.
        BLUE # = 2,
        # The magenta log color, typically used with [`LogLevel::Info`] log levels.
        MAGENTA # = 3,
        # The cyan log color, typically used with [`LogLevel::Info`] log levels.
        CYAN # = 4,
        # The yellow log color, typically used with [`LogLevel::Warning`] log levels.
        YELLOW # = 5,
        # The red log color, typically used with [`LogLevel::Error`] level.
        RED # = 6,

    # The log level for log messages.
    cpdef enum LogLevel:
        # The **DBG** debug log level.
        DEBUG # = 10,
        # The **INF** info log level.
        INFO # = 20,
        # The **WRN** warning log level.
        WARNING # = 30,
        # The **ERR** error log level.
        ERROR # = 40,

    cdef struct LiveClock:
        pass

    # Provides a generic message bus to facilitate various messaging patterns.
    #
    # The bus provides both a producer and consumer API for Pub/Sub, Req/Rep, as
    # well as direct point-to-point messaging to registered endpoints.
    #
    # Pub/Sub wildcard patterns for hierarchical topics are possible:
    #  - `*` asterisk represents one or more characters in a pattern.
    #  - `?` question mark represents a single character in a pattern.
    #
    # Given a topic and pattern potentially containing wildcard characters, i.e.
    # `*` and `?`, where `?` can match any single character in the topic, and `*`
    # can match any number of characters including zero characters.
    #
    # The asterisk in a wildcard matches any character zero or more times. For
    # example, `comp*` matches anything beginning with `comp` which means `comp`,
    # `complete`, and `computer` are all matched.
    #
    # A question mark matches a single character once. For example, `c?mp` matches
    # `camp` and `comp`. The question mark can also be used more than once.
    # For example, `c??p` would match both of the above examples and `coop`.
    cdef struct MessageBus:
        pass

    cdef struct TestClock:
        pass

    cdef struct PyCallableWrapper_t:
        PyObject *ptr;

    # Provides a C compatible Foreign Function Interface (FFI) for an underlying [`TestClock`].
    #
    # This struct wraps `TestClock` in a way that makes it compatible with C function
    # calls, enabling interaction with `TestClock` in a C environment.
    #
    # It implements the `Deref` trait, allowing instances of `TestClock_API` to be
    # dereferenced to `TestClock`, providing access to `TestClock`'s methods without
    # having to manually access the underlying `TestClock` instance.
    cdef struct TestClock_API:
        TestClock *_0;

    # Provides a C compatible Foreign Function Interface (FFI) for an underlying [`LiveClock`].
    #
    # This struct wraps `LiveClock` in a way that makes it compatible with C function
    # calls, enabling interaction with `LiveClock` in a C environment.
    #
    # It implements the `Deref` and `DerefMut` traits, allowing instances of `LiveClock_API` to be
    # dereferenced to `LiveClock`, providing access to `LiveClock`'s methods without
    # having to manually access the underlying `LiveClock` instance. This includes
    # both mutable and immutable access.
    cdef struct LiveClock_API:
        LiveClock *_0;

    # Provides a C compatible Foreign Function Interface (FFI) for an underlying [`MessageBus`].
    #
    # This struct wraps `MessageBus` in a way that makes it compatible with C function
    # calls, enabling interaction with `MessageBus` in a C environment.
    #
    # It implements the `Deref` trait, allowing instances of `MessageBus_API` to be
    # dereferenced to `MessageBus`, providing access to `TestClock`'s methods without
    # having to manually access the underlying `MessageBus` instance.
    cdef struct MessageBus_API:
        MessageBus *_0;

    # Represents a time event occurring at the event timestamp.
    cdef struct TimeEvent_t:
        # The event name.
        char* name;
        # The event ID.
        UUID4_t event_id;
        # The message category
        uint64_t ts_event;
        # The UNIX timestamp (nanoseconds) when the object was initialized.
        uint64_t ts_init;

    # Represents a time event and its associated handler.
    cdef struct TimeEventHandler_t:
        # The event.
        TimeEvent_t event;
        # The Python callable pointer.
        PyObject *callback_ptr;

    PyCallableWrapper_t dummy_callable(PyCallableWrapper_t c);

    TestClock_API test_clock_new();

    void test_clock_drop(TestClock_API clock);

    # # Safety
    #
    # - Assumes `callback_ptr` is a valid `PyCallable` pointer.
    void test_clock_register_default_handler(TestClock_API *clock, PyObject *callback_ptr);

    void test_clock_set_time(const TestClock_API *clock, uint64_t to_time_ns);

    double test_clock_timestamp(const TestClock_API *clock);

    uint64_t test_clock_timestamp_ms(const TestClock_API *clock);

    uint64_t test_clock_timestamp_us(const TestClock_API *clock);

    uint64_t test_clock_timestamp_ns(const TestClock_API *clock);

    PyObject *test_clock_timer_names(const TestClock_API *clock);

    uintptr_t test_clock_timer_count(TestClock_API *clock);

    # # Safety
    #
    # - Assumes `name_ptr` is a valid C string pointer.
    # - Assumes `callback_ptr` is a valid `PyCallable` pointer.
    void test_clock_set_time_alert_ns(TestClock_API *clock,
                                      const char *name_ptr,
                                      uint64_t alert_time_ns,
                                      PyObject *callback_ptr);

    # # Safety
    #
    # - Assumes `name_ptr` is a valid C string pointer.
    # - Assumes `callback_ptr` is a valid `PyCallable` pointer.
    void test_clock_set_timer_ns(TestClock_API *clock,
                                 const char *name_ptr,
                                 uint64_t interval_ns,
                                 uint64_t start_time_ns,
                                 uint64_t stop_time_ns,
                                 PyObject *callback_ptr);

    # # Safety
    #
    # - Assumes `set_time` is a correct `uint8_t` of either 0 or 1.
    CVec test_clock_advance_time(TestClock_API *clock, uint64_t to_time_ns, uint8_t set_time);

    void vec_time_event_handlers_drop(CVec v);

    # # Safety
    #
    # - Assumes `name_ptr` is a valid C string pointer.
    uint64_t test_clock_next_time_ns(TestClock_API *clock, const char *name_ptr);

    # # Safety
    #
    # - Assumes `name_ptr` is a valid C string pointer.
    void test_clock_cancel_timer(TestClock_API *clock, const char *name_ptr);

    void test_clock_cancel_timers(TestClock_API *clock);

    LiveClock_API live_clock_new();

    void live_clock_drop(LiveClock_API clock);

    double live_clock_timestamp(LiveClock_API *clock);

    uint64_t live_clock_timestamp_ms(LiveClock_API *clock);

    uint64_t live_clock_timestamp_us(LiveClock_API *clock);

    uint64_t live_clock_timestamp_ns(LiveClock_API *clock);

    const char *component_state_to_cstr(ComponentState value);

    # Returns an enum from a Python string.
    #
    # # Safety
    #
    # - Assumes `ptr` is a valid C string pointer.
    ComponentState component_state_from_cstr(const char *ptr);

    const char *component_trigger_to_cstr(ComponentTrigger value);

    # Returns an enum from a Python string.
    #
    # # Safety
    #
    # - Assumes `ptr` is a valid C string pointer.
    ComponentTrigger component_trigger_from_cstr(const char *ptr);

    const char *log_level_to_cstr(LogLevel value);

    # Returns an enum from a Python string.
    #
    # # Safety
    #
    # - Assumes `ptr` is a valid C string pointer.
    LogLevel log_level_from_cstr(const char *ptr);

    const char *log_color_to_cstr(LogColor value);

    # Returns an enum from a Python string.
    #
    # # Safety
    #
    # - Assumes `ptr` is a valid C string pointer.
    LogColor log_color_from_cstr(const char *ptr);

    # Returns whether the core logger is enabled.
    uint8_t logging_is_initialized();

    # Initializes tracing.
    #
    # Tracing is meant to be used to trace/debug async Rust code. It can be
    # configured to filter modules and write up to a specific level only using
    # by passing a configuration using the `RUST_LOG` environment variable.
    #
    # # Safety
    #
    # Should only be called once during an applications run, ideally at the
    # beginning of the run.
    void tracing_init();

    # Initializes logging.
    #
    # Logging should be used for Python and sync Rust logic which is most of
    # the components in the main `nautilus_trader` package.
    # Logging can be configured to filter components and write up to a specific level only
    # by passing a configuration using the `NAUTILUS_LOG` environment variable.
    #
    # # Safety
    #
    # Should only be called once during an applications run, ideally at the
    # beginning of the run.
    #
    # - Assume `directory_ptr` is either NULL or a valid C string pointer.
    # - Assume `file_name_ptr` is either NULL or a valid C string pointer.
    # - Assume `file_format_ptr` is either NULL or a valid C string pointer.
    # - Assume `component_level_ptr` is either NULL or a valid C string pointer.
    void logging_init(TraderId_t trader_id,
                      UUID4_t instance_id,
                      LogLevel level_stdout,
                      LogLevel level_file,
                      uint8_t file_logging,
                      const char *directory_ptr,
                      const char *file_name_ptr,
                      const char *file_format_ptr,
                      const char *component_levels_ptr,
                      uint8_t is_colored,
                      uint8_t is_bypassed,
                      uint8_t print_config);

    # Creates a new log event.
    #
    # # Safety
    #
    # - Assumes `component_ptr` is a valid C string pointer.
    # - Assumes `message_ptr` is a valid C string pointer.
    void logger_log(uint64_t timestamp_ns,
                    LogLevel level,
                    LogColor color,
                    const char *component_ptr,
                    const char *message_ptr);

    # Flushes logger buffers.
    void logger_flush();

    # # Safety
    #
    # - Assumes `trader_id_ptr` is a valid C string pointer.
    # - Assumes `name_ptr` is a valid C string pointer.
    MessageBus_API msgbus_new(const char *trader_id_ptr,
                              const char *name_ptr,
                              const char *instance_id_ptr,
                              const char *config_ptr);

    void msgbus_drop(MessageBus_API bus);

    TraderId_t msgbus_trader_id(const MessageBus_API *bus);

    PyObject *msgbus_endpoints(const MessageBus_API *bus);

    PyObject *msgbus_topics(const MessageBus_API *bus);

    PyObject *msgbus_correlation_ids(const MessageBus_API *bus);

    # # Safety
    #
    # - Assumes `pattern_ptr` is a valid C string pointer.
    uint8_t msgbus_has_subscribers(const MessageBus_API *bus, const char *pattern_ptr);

    PyObject *msgbus_subscription_handler_ids(const MessageBus_API *bus);

    PyObject *msgbus_subscriptions(const MessageBus_API *bus);

    # # Safety
    #
    # - Assumes `endpoint_ptr` is a valid C string pointer.
    uint8_t msgbus_is_registered(const MessageBus_API *bus, const char *endpoint_ptr);

    # # Safety
    #
    # - Assumes `topic_ptr` is a valid C string pointer.
    # - Assumes `handler_id_ptr` is a valid C string pointer.
    # - Assumes `py_callable_ptr` points to a valid Python callable.
    uint8_t msgbus_is_subscribed(const MessageBus_API *bus,
                                 const char *topic_ptr,
                                 const char *handler_id_ptr);

    # # Safety
    #
    # - Assumes `endpoint_ptr` is a valid C string pointer.
    uint8_t msgbus_is_pending_response(const MessageBus_API *bus, const UUID4_t *request_id);

    uint64_t msgbus_sent_count(const MessageBus_API *bus);

    uint64_t msgbus_req_count(const MessageBus_API *bus);

    uint64_t msgbus_res_count(const MessageBus_API *bus);

    uint64_t msgbus_pub_count(const MessageBus_API *bus);

    # # Safety
    #
    # - Assumes `endpoint_ptr` is a valid C string pointer.
    # - Assumes `handler_id_ptr` is a valid C string pointer.
    # - Assumes `py_callable_ptr` points to a valid Python callable.
    const char *msgbus_register(MessageBus_API *bus,
                                const char *endpoint_ptr,
                                const char *handler_id_ptr);

    # # Safety
    #
    # - Assumes `endpoint_ptr` is a valid C string pointer.
    void msgbus_deregister(MessageBus_API bus, const char *endpoint_ptr);

    # # Safety
    #
    # - Assumes `topic_ptr` is a valid C string pointer.
    # - Assumes `handler_id_ptr` is a valid C string pointer.
    # - Assumes `py_callable_ptr` points to a valid Python callable.
    const char *msgbus_subscribe(MessageBus_API *bus,
                                 const char *topic_ptr,
                                 const char *handler_id_ptr,
                                 uint8_t priority);

    # # Safety
    #
    # - Assumes `topic_ptr` is a valid C string pointer.
    # - Assumes `handler_id_ptr` is a valid C string pointer.
    # - Assumes `py_callable_ptr` points to a valid Python callable.
    void msgbus_unsubscribe(MessageBus_API *bus, const char *topic_ptr, const char *handler_id_ptr);

    # # Safety
    #
    # - Assumes `endpoint_ptr` is a valid C string pointer.
    # - Returns a NULL pointer if endpoint is not registered.
    const char *msgbus_endpoint_callback(const MessageBus_API *bus, const char *endpoint_ptr);

    # # Safety
    #
    # - Assumes `pattern_ptr` is a valid C string pointer.
    CVec msgbus_matching_callbacks(MessageBus_API *bus, const char *pattern_ptr);

    void vec_pycallable_drop(CVec v);

    # # Safety
    #
    # - Assumes `endpoint_ptr` is a valid C string pointer.
    # - Potentially returns a pointer to `Py_None`.
    const char *msgbus_request_callback(MessageBus_API *bus,
                                        const char *endpoint_ptr,
                                        UUID4_t request_id,
                                        const char *handler_id_ptr);

    # # Safety
    #
    # - Potentially returns a pointer to `Py_None`.
    const char *msgbus_response_callback(MessageBus_API *bus, const UUID4_t *correlation_id);

    # # Safety
    #
    # - Potentially returns a pointer to `Py_None`.
    const char *msgbus_correlation_id_handler(MessageBus_API *bus, const UUID4_t *correlation_id);

    # # Safety
    #
    # - Assumes `topic_ptr` is a valid C string pointer.
    # - Assumes `pattern_ptr` is a valid C string pointer.
    uint8_t msgbus_is_matching(const char *topic_ptr, const char *pattern_ptr);

    # # Safety
    #
    # - Assumes `topic_ptr` is a valid C string pointer.
    # - Assumes `handler_id_ptr` is a valid C string pointer.
    # - Assumes `py_callable_ptr` points to a valid Python callable.
    void msgbus_publish_external(MessageBus_API *bus,
                                 const char *topic_ptr,
                                 const char *payload_ptr);

    # # Safety
    #
    # - Assumes `name_ptr` is borrowed from a valid Python UTF-8 `str`.
    TimeEvent_t time_event_new(const char *name_ptr,
                               UUID4_t event_id,
                               uint64_t ts_event,
                               uint64_t ts_init);

    # Returns a [`TimeEvent`] as a C string pointer.
    const char *time_event_to_cstr(const TimeEvent_t *event);

    TimeEventHandler_t dummy(TimeEventHandler_t v);
