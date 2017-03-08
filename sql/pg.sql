--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: archive; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE archive (
    username text NOT NULL,
    "timestamp" bigint NOT NULL,
    peer text NOT NULL,
    bare_peer text NOT NULL,
    xml text NOT NULL,
    txt text,
    id integer NOT NULL,
    kind text,
    nick text,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE archive OWNER TO ejabberd;

--
-- Name: archive_id_seq; Type: SEQUENCE; Schema: public; Owner: ejabberd
--

CREATE SEQUENCE archive_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE archive_id_seq OWNER TO ejabberd;

--
-- Name: archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ejabberd
--

ALTER SEQUENCE archive_id_seq OWNED BY archive.id;


--
-- Name: archive_prefs; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE archive_prefs (
    username text NOT NULL,
    def text NOT NULL,
    always text NOT NULL,
    never text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE archive_prefs OWNER TO ejabberd;

--
-- Name: caps_features; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE caps_features (
    node text NOT NULL,
    subnode text NOT NULL,
    feature text,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE caps_features OWNER TO ejabberd;

--
-- Name: irc_custom; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE irc_custom (
    jid text NOT NULL,
    host text NOT NULL,
    data text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE irc_custom OWNER TO ejabberd;

--
-- Name: last; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE last (
    username text NOT NULL,
    seconds text NOT NULL,
    state text NOT NULL
);


ALTER TABLE last OWNER TO ejabberd;

--
-- Name: motd; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE motd (
    username text NOT NULL,
    xml text,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE motd OWNER TO ejabberd;

--
-- Name: muc_registered; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE muc_registered (
    jid text NOT NULL,
    host text NOT NULL,
    nick text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE muc_registered OWNER TO ejabberd;

--
-- Name: muc_room; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE muc_room (
    name text NOT NULL,
    host text NOT NULL,
    opts text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE muc_room OWNER TO ejabberd;

--
-- Name: oauth_token; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE oauth_token (
    token text NOT NULL,
    jid text NOT NULL,
    scope text NOT NULL,
    expire bigint NOT NULL
);


ALTER TABLE oauth_token OWNER TO ejabberd;

--
-- Name: privacy_default_list; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE privacy_default_list (
    username text NOT NULL,
    name text NOT NULL
);


ALTER TABLE privacy_default_list OWNER TO ejabberd;

--
-- Name: privacy_list; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE privacy_list (
    username text NOT NULL,
    name text NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE privacy_list OWNER TO ejabberd;

--
-- Name: privacy_list_data; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE privacy_list_data (
    id bigint,
    t character(1) NOT NULL,
    value text NOT NULL,
    action character(1) NOT NULL,
    ord numeric NOT NULL,
    match_all boolean NOT NULL,
    match_iq boolean NOT NULL,
    match_message boolean NOT NULL,
    match_presence_in boolean NOT NULL,
    match_presence_out boolean NOT NULL
);


ALTER TABLE privacy_list_data OWNER TO ejabberd;

--
-- Name: privacy_list_id_seq; Type: SEQUENCE; Schema: public; Owner: ejabberd
--

CREATE SEQUENCE privacy_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE privacy_list_id_seq OWNER TO ejabberd;

--
-- Name: privacy_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ejabberd
--

ALTER SEQUENCE privacy_list_id_seq OWNED BY privacy_list.id;


--
-- Name: private_storage; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE private_storage (
    username text NOT NULL,
    namespace text NOT NULL,
    data text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE private_storage OWNER TO ejabberd;

--
-- Name: pubsub_item; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE pubsub_item (
    nodeid bigint,
    itemid text NOT NULL,
    publisher text NOT NULL,
    creation text NOT NULL,
    modification text NOT NULL,
    payload text DEFAULT ''::text NOT NULL
);


ALTER TABLE pubsub_item OWNER TO ejabberd;

--
-- Name: pubsub_node; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE pubsub_node (
    host text NOT NULL,
    node text NOT NULL,
    parent text DEFAULT ''::text NOT NULL,
    type text NOT NULL,
    nodeid integer NOT NULL
);


ALTER TABLE pubsub_node OWNER TO ejabberd;

--
-- Name: pubsub_node_nodeid_seq; Type: SEQUENCE; Schema: public; Owner: ejabberd
--

CREATE SEQUENCE pubsub_node_nodeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pubsub_node_nodeid_seq OWNER TO ejabberd;

--
-- Name: pubsub_node_nodeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ejabberd
--

ALTER SEQUENCE pubsub_node_nodeid_seq OWNED BY pubsub_node.nodeid;


--
-- Name: pubsub_node_option; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE pubsub_node_option (
    nodeid bigint,
    name text NOT NULL,
    val text NOT NULL
);


ALTER TABLE pubsub_node_option OWNER TO ejabberd;

--
-- Name: pubsub_node_owner; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE pubsub_node_owner (
    nodeid bigint,
    owner text NOT NULL
);


ALTER TABLE pubsub_node_owner OWNER TO ejabberd;

--
-- Name: pubsub_state; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE pubsub_state (
    nodeid bigint,
    jid text NOT NULL,
    affiliation character(1),
    subscriptions text DEFAULT ''::text NOT NULL,
    stateid integer NOT NULL
);


ALTER TABLE pubsub_state OWNER TO ejabberd;

--
-- Name: pubsub_state_stateid_seq; Type: SEQUENCE; Schema: public; Owner: ejabberd
--

CREATE SEQUENCE pubsub_state_stateid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pubsub_state_stateid_seq OWNER TO ejabberd;

--
-- Name: pubsub_state_stateid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ejabberd
--

ALTER SEQUENCE pubsub_state_stateid_seq OWNED BY pubsub_state.stateid;


--
-- Name: pubsub_subscription_opt; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE pubsub_subscription_opt (
    subid text NOT NULL,
    opt_name character varying(32),
    opt_value text NOT NULL
);


ALTER TABLE pubsub_subscription_opt OWNER TO ejabberd;

--
-- Name: roster_version; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE roster_version (
    username text NOT NULL,
    version text NOT NULL
);


ALTER TABLE roster_version OWNER TO ejabberd;

--
-- Name: rostergroups; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE rostergroups (
    username text NOT NULL,
    jid text NOT NULL,
    grp text NOT NULL
);


ALTER TABLE rostergroups OWNER TO ejabberd;

--
-- Name: rosterusers; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE rosterusers (
    username text NOT NULL,
    jid text NOT NULL,
    nick text NOT NULL,
    subscription character(1) NOT NULL,
    ask character(1) NOT NULL,
    askmessage text NOT NULL,
    server character(1) NOT NULL,
    subscribe text NOT NULL,
    type text,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE rosterusers OWNER TO ejabberd;

--
-- Name: sm; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE sm (
    usec bigint NOT NULL,
    pid text NOT NULL,
    node text NOT NULL,
    username text NOT NULL,
    resource text NOT NULL,
    priority text NOT NULL,
    info text NOT NULL
);


ALTER TABLE sm OWNER TO ejabberd;

--
-- Name: spool; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE spool (
    username text NOT NULL,
    xml text NOT NULL,
    seq integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE spool OWNER TO ejabberd;

--
-- Name: spool_seq_seq; Type: SEQUENCE; Schema: public; Owner: ejabberd
--

CREATE SEQUENCE spool_seq_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spool_seq_seq OWNER TO ejabberd;

--
-- Name: spool_seq_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ejabberd
--

ALTER SEQUENCE spool_seq_seq OWNED BY spool.seq;


--
-- Name: sr_group; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE sr_group (
    name text NOT NULL,
    opts text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE sr_group OWNER TO ejabberd;

--
-- Name: sr_user; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE sr_user (
    jid text NOT NULL,
    grp text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE sr_user OWNER TO ejabberd;

--
-- Name: users; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE users (
    username text NOT NULL,
    password text NOT NULL,
    serverkey text DEFAULT ''::text NOT NULL,
    salt text DEFAULT ''::text NOT NULL,
    iterationcount integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE users OWNER TO ejabberd;

--
-- Name: vcard; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE vcard (
    username text NOT NULL,
    vcard text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE vcard OWNER TO ejabberd;

--
-- Name: vcard_search; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE vcard_search (
    username text NOT NULL,
    lusername text NOT NULL,
    fn text NOT NULL,
    lfn text NOT NULL,
    family text NOT NULL,
    lfamily text NOT NULL,
    given text NOT NULL,
    lgiven text NOT NULL,
    middle text NOT NULL,
    lmiddle text NOT NULL,
    nickname text NOT NULL,
    lnickname text NOT NULL,
    bday text NOT NULL,
    lbday text NOT NULL,
    ctry text NOT NULL,
    lctry text NOT NULL,
    locality text NOT NULL,
    llocality text NOT NULL,
    email text NOT NULL,
    lemail text NOT NULL,
    orgname text NOT NULL,
    lorgname text NOT NULL,
    orgunit text NOT NULL,
    lorgunit text NOT NULL
);


ALTER TABLE vcard_search OWNER TO ejabberd;

--
-- Name: vcard_xupdate; Type: TABLE; Schema: public; Owner: ejabberd
--

CREATE TABLE vcard_xupdate (
    username text NOT NULL,
    hash text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE vcard_xupdate OWNER TO ejabberd;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY archive ALTER COLUMN id SET DEFAULT nextval('archive_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY privacy_list ALTER COLUMN id SET DEFAULT nextval('privacy_list_id_seq'::regclass);


--
-- Name: nodeid; Type: DEFAULT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY pubsub_node ALTER COLUMN nodeid SET DEFAULT nextval('pubsub_node_nodeid_seq'::regclass);


--
-- Name: stateid; Type: DEFAULT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY pubsub_state ALTER COLUMN stateid SET DEFAULT nextval('pubsub_state_stateid_seq'::regclass);


--
-- Name: seq; Type: DEFAULT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY spool ALTER COLUMN seq SET DEFAULT nextval('spool_seq_seq'::regclass);


--
-- Data for Name: archive; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY archive (username, "timestamp", peer, bare_peer, xml, txt, id, kind, nick, created_at) FROM stdin;
\.


--
-- Name: archive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ejabberd
--

SELECT pg_catalog.setval('archive_id_seq', 1, false);


--
-- Data for Name: archive_prefs; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY archive_prefs (username, def, always, never, created_at) FROM stdin;
\.


--
-- Data for Name: caps_features; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY caps_features (node, subnode, feature, created_at) FROM stdin;
\.


--
-- Data for Name: irc_custom; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY irc_custom (jid, host, data, created_at) FROM stdin;
\.


--
-- Data for Name: last; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY last (username, seconds, state) FROM stdin;
\.


--
-- Data for Name: motd; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY motd (username, xml, created_at) FROM stdin;
\.


--
-- Data for Name: muc_registered; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY muc_registered (jid, host, nick, created_at) FROM stdin;
\.


--
-- Data for Name: muc_room; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY muc_room (name, host, opts, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_token; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY oauth_token (token, jid, scope, expire) FROM stdin;
\.


--
-- Data for Name: privacy_default_list; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY privacy_default_list (username, name) FROM stdin;
admin	Blocked contacts
+60137138203	Blocked contacts
\.


--
-- Data for Name: privacy_list; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY privacy_list (username, name, id, created_at) FROM stdin;
admin	Blocked contacts	1	2017-03-07 12:48:02.186485
+60137138203	Blocked contacts	2	2017-03-07 12:50:16.381779
\.


--
-- Data for Name: privacy_list_data; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY privacy_list_data (id, t, value, action, ord, match_all, match_iq, match_message, match_presence_in, match_presence_out) FROM stdin;
1	j	user12@localhost	d	0	t	f	f	f	f
1	j	user3@localhost	d	0	t	f	f	f	f
1	j	user3@localhost	d	0	t	f	f	f	f
1	j	user3@localhost	d	0	t	f	f	f	f
1	j	user3@localhost	d	0	t	f	f	f	f
2	j	user2@localhost	d	0	t	f	f	f	f
2	j	user10@localhost	d	0	t	f	f	f	f
1	j	user333@localhost	d	0	t	f	f	f	f
\.


--
-- Name: privacy_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ejabberd
--

SELECT pg_catalog.setval('privacy_list_id_seq', 2, true);


--
-- Data for Name: private_storage; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY private_storage (username, namespace, data, created_at) FROM stdin;
\.


--
-- Data for Name: pubsub_item; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY pubsub_item (nodeid, itemid, publisher, creation, modification, payload) FROM stdin;
\.


--
-- Data for Name: pubsub_node; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY pubsub_node (host, node, parent, type, nodeid) FROM stdin;
\.


--
-- Name: pubsub_node_nodeid_seq; Type: SEQUENCE SET; Schema: public; Owner: ejabberd
--

SELECT pg_catalog.setval('pubsub_node_nodeid_seq', 1, false);


--
-- Data for Name: pubsub_node_option; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY pubsub_node_option (nodeid, name, val) FROM stdin;
\.


--
-- Data for Name: pubsub_node_owner; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY pubsub_node_owner (nodeid, owner) FROM stdin;
\.


--
-- Data for Name: pubsub_state; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY pubsub_state (nodeid, jid, affiliation, subscriptions, stateid) FROM stdin;
\.


--
-- Name: pubsub_state_stateid_seq; Type: SEQUENCE SET; Schema: public; Owner: ejabberd
--

SELECT pg_catalog.setval('pubsub_state_stateid_seq', 1, false);


--
-- Data for Name: pubsub_subscription_opt; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY pubsub_subscription_opt (subid, opt_name, opt_value) FROM stdin;
\.


--
-- Data for Name: roster_version; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY roster_version (username, version) FROM stdin;
\.


--
-- Data for Name: rostergroups; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY rostergroups (username, jid, grp) FROM stdin;
\.


--
-- Data for Name: rosterusers; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY rosterusers (username, jid, nick, subscription, ask, askmessage, server, subscribe, type, created_at) FROM stdin;
\.


--
-- Data for Name: sm; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY sm (usec, pid, node, username, resource, priority, info) FROM stdin;
\.


--
-- Data for Name: spool; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY spool (username, xml, seq, created_at) FROM stdin;
\.


--
-- Name: spool_seq_seq; Type: SEQUENCE SET; Schema: public; Owner: ejabberd
--

SELECT pg_catalog.setval('spool_seq_seq', 1, false);


--
-- Data for Name: sr_group; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY sr_group (name, opts, created_at) FROM stdin;
\.


--
-- Data for Name: sr_user; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY sr_user (jid, grp, created_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY users (username, password, serverkey, salt, iterationcount, created_at) FROM stdin;
\.


--
-- Data for Name: vcard; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY vcard (username, vcard, created_at) FROM stdin;
\.


--
-- Data for Name: vcard_search; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY vcard_search (username, lusername, fn, lfn, family, lfamily, given, lgiven, middle, lmiddle, nickname, lnickname, bday, lbday, ctry, lctry, locality, llocality, email, lemail, orgname, lorgname, orgunit, lorgunit) FROM stdin;
\.


--
-- Data for Name: vcard_xupdate; Type: TABLE DATA; Schema: public; Owner: ejabberd
--

COPY vcard_xupdate (username, hash, created_at) FROM stdin;
\.


--
-- Name: archive_prefs_pkey; Type: CONSTRAINT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY archive_prefs
    ADD CONSTRAINT archive_prefs_pkey PRIMARY KEY (username);


--
-- Name: last_pkey; Type: CONSTRAINT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY last
    ADD CONSTRAINT last_pkey PRIMARY KEY (username);


--
-- Name: motd_pkey; Type: CONSTRAINT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY motd
    ADD CONSTRAINT motd_pkey PRIMARY KEY (username);


--
-- Name: privacy_default_list_pkey; Type: CONSTRAINT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY privacy_default_list
    ADD CONSTRAINT privacy_default_list_pkey PRIMARY KEY (username);


--
-- Name: privacy_list_id_key; Type: CONSTRAINT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY privacy_list
    ADD CONSTRAINT privacy_list_id_key UNIQUE (id);


--
-- Name: pubsub_node_nodeid_key; Type: CONSTRAINT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY pubsub_node
    ADD CONSTRAINT pubsub_node_nodeid_key UNIQUE (nodeid);


--
-- Name: pubsub_state_stateid_key; Type: CONSTRAINT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY pubsub_state
    ADD CONSTRAINT pubsub_state_stateid_key UNIQUE (stateid);


--
-- Name: roster_version_pkey; Type: CONSTRAINT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY roster_version
    ADD CONSTRAINT roster_version_pkey PRIMARY KEY (username);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: vcard_pkey; Type: CONSTRAINT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY vcard
    ADD CONSTRAINT vcard_pkey PRIMARY KEY (username);


--
-- Name: vcard_search_pkey; Type: CONSTRAINT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY vcard_search
    ADD CONSTRAINT vcard_search_pkey PRIMARY KEY (lusername);


--
-- Name: vcard_xupdate_pkey; Type: CONSTRAINT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY vcard_xupdate
    ADD CONSTRAINT vcard_xupdate_pkey PRIMARY KEY (username);


--
-- Name: i_bare_peer; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_bare_peer ON archive USING btree (bare_peer);


--
-- Name: i_caps_features_node_subnode; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_caps_features_node_subnode ON caps_features USING btree (node, subnode);


--
-- Name: i_despool; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_despool ON spool USING btree (username);


--
-- Name: i_irc_custom_jid_host; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE UNIQUE INDEX i_irc_custom_jid_host ON irc_custom USING btree (jid, host);


--
-- Name: i_muc_registered_jid_host; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE UNIQUE INDEX i_muc_registered_jid_host ON muc_registered USING btree (jid, host);


--
-- Name: i_muc_registered_nick; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_muc_registered_nick ON muc_registered USING btree (nick);


--
-- Name: i_muc_room_name_host; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE UNIQUE INDEX i_muc_room_name_host ON muc_room USING btree (name, host);


--
-- Name: i_oauth_token_token; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE UNIQUE INDEX i_oauth_token_token ON oauth_token USING btree (token);


--
-- Name: i_peer; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_peer ON archive USING btree (peer);


--
-- Name: i_privacy_list_data_id; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_privacy_list_data_id ON privacy_list_data USING btree (id);


--
-- Name: i_privacy_list_username; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_privacy_list_username ON privacy_list USING btree (username);


--
-- Name: i_privacy_list_username_name; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE UNIQUE INDEX i_privacy_list_username_name ON privacy_list USING btree (username, name);


--
-- Name: i_private_storage_username; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_private_storage_username ON private_storage USING btree (username);


--
-- Name: i_private_storage_username_namespace; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE UNIQUE INDEX i_private_storage_username_namespace ON private_storage USING btree (username, namespace);


--
-- Name: i_pubsub_item_itemid; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_pubsub_item_itemid ON pubsub_item USING btree (itemid);


--
-- Name: i_pubsub_item_tuple; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE UNIQUE INDEX i_pubsub_item_tuple ON pubsub_item USING btree (nodeid, itemid);


--
-- Name: i_pubsub_node_option_nodeid; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_pubsub_node_option_nodeid ON pubsub_node_option USING btree (nodeid);


--
-- Name: i_pubsub_node_owner_nodeid; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_pubsub_node_owner_nodeid ON pubsub_node_owner USING btree (nodeid);


--
-- Name: i_pubsub_node_parent; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_pubsub_node_parent ON pubsub_node USING btree (parent);


--
-- Name: i_pubsub_node_tuple; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE UNIQUE INDEX i_pubsub_node_tuple ON pubsub_node USING btree (host, node);


--
-- Name: i_pubsub_state_jid; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_pubsub_state_jid ON pubsub_state USING btree (jid);


--
-- Name: i_pubsub_state_tuple; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE UNIQUE INDEX i_pubsub_state_tuple ON pubsub_state USING btree (nodeid, jid);


--
-- Name: i_pubsub_subscription_opt; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE UNIQUE INDEX i_pubsub_subscription_opt ON pubsub_subscription_opt USING btree (subid, opt_name);


--
-- Name: i_rosteru_jid; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_rosteru_jid ON rosterusers USING btree (jid);


--
-- Name: i_rosteru_user_jid; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE UNIQUE INDEX i_rosteru_user_jid ON rosterusers USING btree (username, jid);


--
-- Name: i_rosteru_username; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_rosteru_username ON rosterusers USING btree (username);


--
-- Name: i_sm_node; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_sm_node ON sm USING btree (node);


--
-- Name: i_sm_sid; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE UNIQUE INDEX i_sm_sid ON sm USING btree (usec, pid);


--
-- Name: i_sm_username; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_sm_username ON sm USING btree (username);


--
-- Name: i_sr_user_grp; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_sr_user_grp ON sr_user USING btree (grp);


--
-- Name: i_sr_user_jid; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_sr_user_jid ON sr_user USING btree (jid);


--
-- Name: i_sr_user_jid_grp; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE UNIQUE INDEX i_sr_user_jid_grp ON sr_user USING btree (jid, grp);


--
-- Name: i_timestamp; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_timestamp ON archive USING btree ("timestamp");


--
-- Name: i_username; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_username ON archive USING btree (username);


--
-- Name: i_vcard_search_lbday; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_vcard_search_lbday ON vcard_search USING btree (lbday);


--
-- Name: i_vcard_search_lctry; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_vcard_search_lctry ON vcard_search USING btree (lctry);


--
-- Name: i_vcard_search_lemail; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_vcard_search_lemail ON vcard_search USING btree (lemail);


--
-- Name: i_vcard_search_lfamily; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_vcard_search_lfamily ON vcard_search USING btree (lfamily);


--
-- Name: i_vcard_search_lfn; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_vcard_search_lfn ON vcard_search USING btree (lfn);


--
-- Name: i_vcard_search_lgiven; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_vcard_search_lgiven ON vcard_search USING btree (lgiven);


--
-- Name: i_vcard_search_llocality; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_vcard_search_llocality ON vcard_search USING btree (llocality);


--
-- Name: i_vcard_search_lmiddle; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_vcard_search_lmiddle ON vcard_search USING btree (lmiddle);


--
-- Name: i_vcard_search_lnickname; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_vcard_search_lnickname ON vcard_search USING btree (lnickname);


--
-- Name: i_vcard_search_lorgname; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_vcard_search_lorgname ON vcard_search USING btree (lorgname);


--
-- Name: i_vcard_search_lorgunit; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX i_vcard_search_lorgunit ON vcard_search USING btree (lorgunit);


--
-- Name: pk_rosterg_user_jid; Type: INDEX; Schema: public; Owner: ejabberd
--

CREATE INDEX pk_rosterg_user_jid ON rostergroups USING btree (username, jid);


--
-- Name: privacy_list_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY privacy_list_data
    ADD CONSTRAINT privacy_list_data_id_fkey FOREIGN KEY (id) REFERENCES privacy_list(id) ON DELETE CASCADE;


--
-- Name: pubsub_item_nodeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY pubsub_item
    ADD CONSTRAINT pubsub_item_nodeid_fkey FOREIGN KEY (nodeid) REFERENCES pubsub_node(nodeid) ON DELETE CASCADE;


--
-- Name: pubsub_node_option_nodeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY pubsub_node_option
    ADD CONSTRAINT pubsub_node_option_nodeid_fkey FOREIGN KEY (nodeid) REFERENCES pubsub_node(nodeid) ON DELETE CASCADE;


--
-- Name: pubsub_node_owner_nodeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY pubsub_node_owner
    ADD CONSTRAINT pubsub_node_owner_nodeid_fkey FOREIGN KEY (nodeid) REFERENCES pubsub_node(nodeid) ON DELETE CASCADE;


--
-- Name: pubsub_state_nodeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ejabberd
--

ALTER TABLE ONLY pubsub_state
    ADD CONSTRAINT pubsub_state_nodeid_fkey FOREIGN KEY (nodeid) REFERENCES pubsub_node(nodeid) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

